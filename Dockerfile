FROM debian as builder

RUN apt-get update && apt-get install -y curl jq wget unzip
RUN mkdir /app && \
  job_id=$(curl -s https://ci.appveyor.com/api/projects/Genteure/bililiverecorder | jq -r '.build.jobs[0].jobId' | sed '') && \
  artifacts_url="https://ci.appveyor.com/api/buildjobs/${job_id}/artifacts" && \
  artifact_path=$(curl -s "$artifacts_url" | jq -r '.[].fileName' | grep 'linux-x64') && \
  wget -O BililiveRecorder.zip "${artifacts_url}/BililiveRecorder.Cli%2Fpublish%2FBililiveRecorderCliDebugBuild-linux-x64.zip" && \
  unzip BililiveRecorder.zip -d /app && \
  chmod +x /app/BililiveRecorder.Cli

COPY bililive-recorder-run.sh /app

FROM debian

RUN apt-get update && apt-get install -y libssl-dev ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists
COPY --from=builder /app/ /app/

ENV PATH="/app:${PATH}"
VOLUME /store

CMD ["bililive-recorder-run.sh"]
