# AI Prompts

## Creating a prompt

Add prompts using the template framework described in
[workspace/prompt-engine/README.md](../../../prompt-engine/README.md#example-template).

### Frontmatter

| field           | description                                                        | type                                        | required |
| --------------- | ------------------------------------------------------------------ | ------------------------------------------- | -------- |
| name            | name of the prompt, must be unique                                 | string                                      | yes      |
| description     | description of the prompt, is displayed to user for slash commands | string                                      | yes      |
| command         | name of the the slash command                                      | string                                      | no       |
| availability    | where the slash command is available                               | ('chat' \| 'inline')[]                      | no       |
| action          | where to display the response                                      | 'chat' \| 'inline'                          | no       |
| requiredContext | required document state for a command to appear                    | ('selection' \| 'noSelection' \| 'error')[] | no       |

For prompts that aren't used as slash commands, do not add command, availabity, action, or required
context.
