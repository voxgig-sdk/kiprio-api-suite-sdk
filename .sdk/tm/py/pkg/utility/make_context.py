# KiprioApiSuite SDK utility: make_context

from projectname_sdk.core.context import KiprioApiSuiteContext


def make_context_util(ctxmap, basectx):
    return KiprioApiSuiteContext(ctxmap, basectx)
