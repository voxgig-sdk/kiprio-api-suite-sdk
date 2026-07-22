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

func TestUtilityEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Utility(nil)
		if ent == nil {
			t.Fatal("expected non-nil UtilityEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := utilityBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "utility." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set KIPRIOAPISUITE_TEST_UTILITY_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		utilityRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.utility", setup.data)))
		var utilityRef01Data map[string]any
		if len(utilityRef01DataRaw) > 0 {
			utilityRef01Data = core.ToMapAny(utilityRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = utilityRef01Data

		// LOAD
		utilityRef01Ent := client.Utility(nil)
		utilityRef01MatchDt0 := map[string]any{}
		utilityRef01DataDt0Loaded, err := utilityRef01Ent.Load(utilityRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if utilityRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func utilityBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "utility", "UtilityTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read utility test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse utility test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"utility01", "utility02", "utility03"},
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
	entidEnvRaw := os.Getenv("KIPRIOAPISUITE_TEST_UTILITY_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"KIPRIOAPISUITE_TEST_UTILITY_ENTID": idmap,
		"KIPRIOAPISUITE_TEST_LIVE":      "FALSE",
		"KIPRIOAPISUITE_TEST_EXPLAIN":   "FALSE",
		"KIPRIOAPISUITE_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["KIPRIOAPISUITE_TEST_UTILITY_ENTID"])
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
