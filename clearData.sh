#!/bin/bash

sfdx djc:cleardata -o Bank_Account__c -u bulktest
sfdx djc:cleardata -o Bank_Product__c -u bulktest
sfdx djc:cleardata -o Contact -u bulktest
sfdx djc:cleardata -o Account -u bulktest