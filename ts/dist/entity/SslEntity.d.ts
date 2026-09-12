import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Ssl, SslListMatch } from '../KiprioApiSuiteTypes';
declare class SslEntity extends KiprioApiSuiteEntityBase<Ssl> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: SslEntity): SslEntity;
    list(this: any, reqmatch?: SslListMatch, ctrl?: Control): Promise<SslEntity[]>;
}
export { SslEntity };
