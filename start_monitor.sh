#!/usr/bin/env bash
set -e

APP_DIR=$1

if [ ! -d "$APP_DIR" ]; then
  echo "$APP_DIR does not exist. Please provide the path to the directory containing the configuration file."
  exit 1
fi

if [ ! -f "$APP_DIR/config.json" ]; then
  echo "$APP_DIR/config.json does not exist. Please create config file following the README."
  exit 1
fi


docker run -d --rm --name app_monitor -v $APP_DIR:/var/lib/app_monitor app_monitor
