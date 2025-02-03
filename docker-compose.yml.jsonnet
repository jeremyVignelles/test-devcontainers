local ddb = import 'ddb.docker.libjsonnet';

local domain = std.join('.', [std.extVar('core.domain.sub'), std.extVar('core.domain.ext')]);
ddb.Compose(
  ddb.with(
    import '.docker/node/djp.libjsonnet',
    append=ddb.VirtualHost('8080', domain, 'app')
  ) + {
    services: {},
  }
)
