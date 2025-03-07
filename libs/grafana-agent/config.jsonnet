local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '0.20', version:'0.20.0'}
];

config.new(
  name='grafana-agent',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/grafana/agent/v%s/production/operator/crds' % v.version,
      output: v.output,
      prefix: '^com\\.grafana\\..*',
      crds: [
        '%s/monitoring.grafana.com_grafanaagents.yaml' % url,
        '%s/monitoring.grafana.com_logsinstances.yaml' % url,
        '%s/monitoring.grafana.com_metricsinstances.yaml' % url,
        '%s/monitoring.grafana.com_podlogs.yaml' % url,
      ],
      localName: 'grafana-agent',
    }
    for v in versions
  ]
)
