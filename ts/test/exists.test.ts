
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { KiprioApiSuiteSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await KiprioApiSuiteSDK.test()
    equal(null !== testsdk, true)
  })

})
