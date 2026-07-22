# KiprioApiSuite SDK utility: make_context

from core.context import KiprioApiSuiteContext


def make_context_util(ctxmap, basectx):
    return KiprioApiSuiteContext(ctxmap, basectx)
