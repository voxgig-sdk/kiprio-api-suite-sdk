import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { Generate, GenerateLoadMatch } from '../KiprioApiSuiteTypes';
declare class GenerateEntity extends KiprioApiSuiteEntityBase<Generate> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: GenerateEntity): GenerateEntity;
    load(this: any, reqmatch?: GenerateLoadMatch, ctrl?: Control): Promise<GenerateEntity>;
}
export { GenerateEntity };
