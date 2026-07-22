
import { Context } from './Context'


class KiprioApiSuiteError extends Error {

  isKiprioApiSuiteError = true

  sdk = 'KiprioApiSuite'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  KiprioApiSuiteError
}

