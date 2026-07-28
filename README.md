# Chrisdev Symfony Flex recipes

Central Symfony Flex recipes repository for Chrisdev packages.

## Included recipes

### `chrisdev/symfony-quality-cockpit`

The `dev-main` recipe:

- enables `Chrisdev\QualityCockpit\QualityCockpitBundle`;
- installs the default `quality_cockpit` configuration;
- imports the bundle routes;
- prints the required Tailwind and Stimulus frontend integration steps.

The recipe intentionally does not overwrite the host application's frontend entrypoints.

## Testing from a local Symfony application

In a disposable Symfony application, configure the local recipe endpoint and the local bundle
path repository, then require the bundle:

```json
{
    "repositories": [
        {
            "type": "path",
            "url": "../../symfony-quality-cockpit",
            "options": {"symlink": true}
        }
    ],
    "extra": {
        "symfony": {
            "endpoint": [
                "file:///absolute/path/to/symfony-quality-recipes/index.json",
                "flex://defaults"
            ]
        }
    }
}
```

Then run:

```bash
composer require --dev chrisdev/symfony-quality-cockpit:@dev -W
composer recipes
php bin/console debug:config quality_cockpit
php bin/console debug:router | grep quality
php bin/console cache:clear
```
