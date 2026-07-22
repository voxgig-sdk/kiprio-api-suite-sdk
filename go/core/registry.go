package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewDnsResultEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewDomainEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewEmailValidateEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewGenerateEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewGrammarEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewIpnEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewRedactEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewSslEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewUtilityEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

var NewWhoiEntityFunc func(client *KiprioApiSuiteSDK, entopts map[string]any) KiprioApiSuiteEntity

