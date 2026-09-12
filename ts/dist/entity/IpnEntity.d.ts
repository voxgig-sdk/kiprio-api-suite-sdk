import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Ipn, IpnLoadMatch } from '../KiprioApiSuiteTypes';
declare class IpnEntity extends KiprioApiSuiteEntityBase<Ipn> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: IpnEntity): IpnEntity;
    load(this: any, reqmatch?: IpnLoadMatch, ctrl?: Control): Promise<IpnEntity>;
}
export { IpnEntity };
