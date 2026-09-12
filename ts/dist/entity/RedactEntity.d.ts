import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Redact, RedactCreateData } from '../KiprioApiSuiteTypes';
declare class RedactEntity extends KiprioApiSuiteEntityBase<Redact> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: RedactEntity): RedactEntity;
    create(this: any, reqdata?: RedactCreateData, ctrl?: Control): Promise<RedactEntity>;
}
export { RedactEntity };
