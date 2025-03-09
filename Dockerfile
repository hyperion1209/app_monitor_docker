FROM python:3.11 AS builder

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

RUN \
<<EOF
  python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel
  python3 -m pip install --no-cache-dir build

  git clone https://github.com/hyperion1209/app_monitor.git /app_monitor
  cd /app_monitor || exit
  python3 -m build
EOF

FROM python:3.11

USER root

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

RUN \
<<EOF
  groupadd --force --gid 1000 --non-unique monitor
  useradd -m -r \
	-d /home/monitor \
  --uid 1000 \
  --gid 1000 \
  --non-unique \
	-c "App Monitor User" \
	monitor

  mkdir -p /var/lib/app_monitor
  chown -R monitor:monitor \
    /var/lib/app_monitor
EOF

COPY --from=builder /app_monitor/dist/* /root/
COPY ./entrypoint.sh /entrypoint.sh

RUN \
<<EOF
  python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel
  python3 -m pip install --no-cache-dir /root/*.whl
EOF

VOLUME ["/var/lib/app_monitor"]

USER monitor

ENTRYPOINT [ "/entrypoint.sh" ]
