# OpenTabletDriver Plugin Repository

This is a repository for [OpenTabletDriver](https://github.com/InfinityGhost/OpenTabletDriver) plugin metadata.

## Directory Nomenclature

In order to achieve maintainability, strict directory naming is enforced.

```
Plugin-Repository/Repository/{Version}/{Owner}/{Repository}/{Name}.json
```

| Key        | Value                                                       |
| ---------- | ----------------------------------------------------------- |
| Version    | The supported OpenTabletDriver version                      |
| Owner      | The owner of the source code repository                     |
| Repository | The name of the source code repository                      |
| Name       | The name of the plugin                                      |

## Plugin Metadata

| Key                                  | Value                                                                                                                                                                                                                  |
|--------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name                                 | The plugin's name.                                                                                                                                                                                                     |
| Owner                                | The username of the plugin owner.                                                                                                                                                                                      |
| Description                          | A brief description of the plugin's function.                                                                                                                                                                          |
| PluginVersion                        | The plugin version in four-part version number format.                                                                                                                                                                 |
| SupportedDriverVersion               | The minimum required OpenTabletDriver version for the plugin to function in four-part version number format.                                                                                                           |
| (Optional) MaxSupportedDriverVersion | The maximum OpenTabletDriver version the plugin functions on in four-part version number format. This should only be included in cases where a minor OpenTabletDriver version introduced breaking changes to a plugin. |
| RepositoryUrl                        | The git repository url containing the plugin's source code.                                                                                                                                                            |
| DownloadUrl                          | The direct download url for the plugin's release files in a compressed archive format. The plugin's dll files must be contained in the top-level directory of the compressed archive.                                  |
| CompressionFormat                    | The compression format used by the compressed archive in the DownloadUrl field. Currently, `zip` is the only supported value.                                                                                          |
| SHA256                               | The SHA265 hash of the compressed archive in the DownloadUrl field.                                                                                                                                                    |
| (Optional) WikiUrl                   | A link to the plugin's documentation.                                                                                                                                                                                  |
| LicenseIdentifier                    | The plugin's SPDX license identifier(s), separated by comma.                                                                                                                                                           |

Example plugin metadata:

```json
{
    "Name": "Example Plugin Name",
    "Owner": "Example Owner",
    "Description": "This is an example plugin. It does nothing and doesn't exist!",
    "PluginVersion": "0.0.1.0",
    "SupportedDriverVersion": "0.9.0.0",
    "RepositoryUrl": "https://github.com/example-plugin/example-plugin",
    "DownloadUrl": "https://github.com/example-plugin/example-plugin/releases/download/0.0.1.0/example-plugin.zip",
    "CompressionFormat": "zip",
    "SHA256": "950630356075f141f88e6482fc34d39f0bf76026ce612b0c1d9be3c76d4aa0d4",
    "WikiUrl": "https://github.com/example-plugin/example-plugin/blob/main/README.md",
    "LicenseIdentifier": "GPL-3.0-only"
}
```
