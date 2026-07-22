# ProjectName SDK exists test

import pytest
from kiprioapisuite_sdk import KiprioApiSuiteSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = KiprioApiSuiteSDK.test(None, None)
        assert testsdk is not None
