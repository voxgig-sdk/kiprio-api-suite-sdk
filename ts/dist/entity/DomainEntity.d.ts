import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Domain, DomainListMatch } from '../KiprioApiSuiteTypes';
declare class DomainEntity extends KiprioApiSuiteEntityBase<Domain> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: DomainEntity): DomainEntity;
    list(this: any, reqmatch?: DomainListMatch, ctrl?: Control): Promise<DomainEntity[]>;
}
export { DomainEntity };
