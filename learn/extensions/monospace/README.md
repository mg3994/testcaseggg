# Monsopace VS-Code Plugin

For making any changes, run `npm version patch` before commiting and pushing.

## Pre-reqs

- Node
- npm
- vsce: `npm install -g vsce`

## Developement

First start the previewserver in a separate tab

```
npm --workspace previewserver run dev
```

The preview server maintains the config in `/tmp/previewserver.json`. Change the state to `ready` in case you want to work on the `ready` state.
Now run the plugin by

```
npm --workspace vscodeplugin run watch
```

Open the Monospace repo in vscode, open the "Run and Debug" panel, select "Launch Monospace Plugin" and hit the "run" button which should open a new
vscode window in which you can open any code folder you like to simulate it opening in Monospace.

## To build plugin and copy to container use

`./workspace/build-container.sh` from the root of the repo.
