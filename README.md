# Utility scripts for some workflow tasks and other seemingly random use cases

> This repo contains utility scripts I have created over time that are useful to me for certain (sometimes seemingly random) tasks. They are personalised to my workflow and needs

Feel free to take inspiration from the scripts for your own set-up, or submit a PR if you want to show me something new / from your workflow!

## Using the tools

Using the tools will require a UNIX environment and the bash shell. You also will need `sudo` access on the machine, as the symlinks need to be created to `/usr/local/bin`

- `apps` -> contains tools to launch flatpaks without any debug lines or using the flatpak command directly
- `github` -> contains tools for interacting with the GitHub CLI
- `obsidian` -> contains tools for launching directly into a specified obsidian vault, you will need to edit the names to work for your environment
- `workspace_scripts` -> an ongoing effort to automate setting up certain windows via a single command. This currently doesn't work as interacting with the PopOS tiling manager is not straightforward as far as I can tell (No built in CLI). I don't recommend using anything in here.

To install all tools:

```bash
sudo make install
```

Or do the same within the relevant directory for only that subset of tools
