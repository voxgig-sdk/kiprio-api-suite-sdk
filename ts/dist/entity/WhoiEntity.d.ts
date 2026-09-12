import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Whoi, WhoiListMatch } from '../KiprioApiSuiteTypes';
declare class WhoiEntity extends KiprioApiSuiteEntityBase<Whoi> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: WhoiEntity): WhoiEntity;
    list(this: any, reqmatch?: WhoiListMatch, ctrl?: Control): Promise<WhoiEntity[]>;
}
export { WhoiEntity };
