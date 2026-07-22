package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/kiprio-api-suite-sdk/go"
	"github.com/voxgig-sdk/kiprio-api-suite-sdk/go/core"

	vs "github.com/voxgig-sdk/kiprio-api-suite-sdk/go/utility/struct"
)

func TestGrammarEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Grammar(nil)
		if ent == nil {
			t.Fatal("expected non-nil GrammarEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := grammarBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "grammar." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set KIPRIOAPISUITE_TEST_GRAMMAR_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		grammarRef01Ent := client.Grammar(nil)
		grammarRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "grammar"}, setup.data), "grammar_ref01"))

		grammarRef01DataResult, err := grammarRef01Ent.Create(grammarRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		grammarRef01Data = core.ToMapAny(grammarRef01DataResult)
		if grammarRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func grammarBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "grammar", "GrammarTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read grammar test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse grammar test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"grammar01", "grammar02", "grammar03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("KIPRIOAPISUITE_TEST_GRAMMAR_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"KIPRIOAPISUITE_TEST_GRAMMAR_ENTID": idmap,
		"KIPRIOAPISUITE_TEST_LIVE":      "FALSE",
		"KIPRIOAPISUITE_TEST_EXPLAIN":   "FALSE",
		"KIPRIOAPISUITE_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["KIPRIOAPISUITE_TEST_GRAMMAR_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["KIPRIOAPISUITE_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["KIPRIOAPISUITE_APIKEY"],
			},
			extra,
		})
		client = sdk.NewKiprioApiSuiteSDK(core.ToMapAny(mergedOpts))
	}

	live := env["KIPRIOAPISUITE_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["KIPRIOAPISUITE_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
