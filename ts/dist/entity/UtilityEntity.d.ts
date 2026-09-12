import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Utility, UtilityLoadMatch } from '../KiprioApiSuiteTypes';
declare class UtilityEntity extends KiprioApiSuiteEntityBase<Utility> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: UtilityEntity): UtilityEntity;
    load(this: any, reqmatch?: UtilityLoadMatch, ctrl?: Control): Promise<UtilityEntity>;
}
export { UtilityEntity };
