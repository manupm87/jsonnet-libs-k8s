local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '2.6', version:'2.6.1'}
];

config.new(
  name='keda',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/kedacore/keda/v%s/config/crd/bases' % v.version,
      output: v.output,
      prefix: '^sh\\.keda\\..*',
      crds: [
        '%s/keda.sh_clustertriggerauthentications.yaml' % url,
        '%s/keda.sh_scaledjobs.yaml' % url,
        '%s/keda.sh_scaledobjects.yaml' % url,
        '%s/keda.sh_triggerauthentications.yaml' % url,
      ],
      localName: 'keda',
    }
    for v in versions
  ]
)
