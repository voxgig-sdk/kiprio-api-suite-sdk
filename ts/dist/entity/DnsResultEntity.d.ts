import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { DnsResult, DnsResultLoadMatch } from '../KiprioApiSuiteTypes';
declare class DnsResultEntity extends KiprioApiSuiteEntityBase<DnsResult> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: DnsResultEntity): DnsResultEntity;
    load(this: any, reqmatch?: DnsResultLoadMatch, ctrl?: Control): Promise<DnsResultEntity>;
}
export { DnsResultEntity };
