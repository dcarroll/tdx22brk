#!/bin/bash

sfdx force:data:tree:import -p data/exported/TDXPlan.json --json --loglevel debug
