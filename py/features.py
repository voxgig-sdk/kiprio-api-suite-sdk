# KiprioApiSuite SDK feature factory

from feature.base_feature import KiprioApiSuiteBaseFeature
from feature.test_feature import KiprioApiSuiteTestFeature


def _make_feature(name):
    features = {
        "base": lambda: KiprioApiSuiteBaseFeature(),
        "test": lambda: KiprioApiSuiteTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
