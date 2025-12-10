# Claude Code Caffeinate

A simple plugin that prevents your Mac from sleeping while [Claude Code](https://github.com/anthropics/claude-code) is working.

## How It Works

Uses macOS's built-in `caffeinate` command with a 5-minute auto-expiring timer that resets on activity.

**Triggers that reset the timer:**
- `UserPromptSubmit` - When you send a prompt
- `PreToolUse` / `PostToolUse` - Before/after each tool (Bash, Read, Write, etc.)
- `SubagentStop` - When subagents finish
- `Notification` - On Claude notifications

**Cleanup hooks:**
- `Stop` - Kills caffeinate when Claude finishes responding
- `SessionEnd` - Kills caffeinate when session ends

**Failsafe:** If Claude crashes or Ctrl+C doesn't trigger hooks, caffeinate auto-expires after 5 minutes of inactivity.

## Installation

### 1. Add the Marketplace

```bash
claude
/plugin marketplace add boostvolt/claude-code-caffeinate
```

### 2. Install the Plugin

```bash
/plugin install caffeinate@claude-code-caffeinate
```

Or browse and install interactively:

```bash
/plugin
```

## Verify It's Working

While Claude is responding, run in another terminal:

```bash
pgrep caffeinate
```

If it returns a process ID, caffeinate is active.

## Caffeinate Flags

The plugin uses these flags:

- `-d` - Prevent display sleep
- `-i` - Prevent system idle sleep
- `-s` - Prevent system sleep (when on AC power)
- `-t 300` - Auto-expire after 5 minutes (300 seconds)

## Requirements

- macOS (uses native `caffeinate` command)
- Claude Code

## License

MIT
