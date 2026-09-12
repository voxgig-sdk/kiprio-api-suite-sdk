import { KiprioApiSuiteEntityBase } from '../KiprioApiSuiteEntityBase';
import type { KiprioApiSuiteSDK } from '../KiprioApiSuiteSDK';
import type { Control } from '../types';
import type { EmailValidate, EmailValidateLoadMatch } from '../KiprioApiSuiteTypes';
declare class EmailValidateEntity extends KiprioApiSuiteEntityBase<EmailValidate> {
    constructor(client: KiprioApiSuiteSDK, entopts: any);
    make(this: EmailValidateEntity): EmailValidateEntity;
    load(this: any, reqmatch?: EmailValidateLoadMatch, ctrl?: Control): Promise<EmailValidateEntity>;
}
export { EmailValidateEntity };
