# clawkit

Quickly install curated OpenClaw skill packs. No more hunting for skills one by one.

## Install

```bash
curl -sSL https://raw.githubusercontent.com/Shinomiya-s/clawkit/main/install.sh | bash
```

Or clone and install manually:

```bash
git clone https://github.com/Shinomiya-s/clawkit.git
cd clawkit
./install.sh
```

## Usage

```bash
# Install essential skills (recommended for new users)
clawkit install essential

# Install a specific profile
clawkit install --profile developer

# List available skills and profiles
clawkit list

# Update installed skills
clawkit update

# Uninstall clawkit
clawkit uninstall
```

## What's included

**Essential pack** - stuff you'll probably want:
- `skill-vetter` - check skills before installing (security)
- `self-improving-agent` - remembers your corrections
- `mcp-duckgo` - web search via DuckDuckGo
- `desktop-control` - mouse/keyboard automation

**Profiles:**
- `developer` - git helpers, code review, file tools
- `productivity` - weather, reminders, web fetch
- `minimal` - just the basics

## How it works

1. Tries to install from clawhub first (if available)
2. Falls back to cloning from GitHub
3. Copies skills to your `~/.openclaw/skills/` directory
4. Updates your OpenClaw config if needed

## Requirements

- OpenClaw installed
- `git` and `curl` available
- Bash 4.0+

## License

MIT
