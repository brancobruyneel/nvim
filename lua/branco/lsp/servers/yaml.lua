local gitlab_ci_schema =
  "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"

return {
  "yamlls",
  lsp = {
    settings = {
      yaml = {
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        -- SchemaStore only claims .gitlab-ci.yml; ci-templates holds plain .yml
        -- files that are also only ever CI config
        schemas = {
          [gitlab_ci_schema] = {
            "**/.gitlab-ci.yml",
            "**/.gitlab-ci.yaml",
            "**/ci-templates/**/*.yml",
            "**/ci-templates/**/*.yaml",
          },
        },
      },
    },
  },
}
