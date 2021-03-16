#!/bin/bash
set -euo pipefail

cat /config/config.json >/store/config.json

/app/BililiveRecorder.Cli run /store
