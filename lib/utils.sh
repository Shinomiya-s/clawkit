# Utility functions for clawkit

# Colors (optional)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[*]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}[x]${NC} $1"
}

# Check if a skill is already installed
is_installed() {
    local skill="$1"
    [ -d "${SKILLS_DIR}/${skill}" ]
}

# Get skill info from JSON
get_skill_info() {
    local skill="$1"
    local field="$2"
    local json_file="${CLAWKIT_DIR}/essential/skills.json"
    
    if command -v jq &> /dev/null; then
        jq -r ".skills[] | select(.name == \"$skill\") | .$field" "$json_file" 2>/dev/null
    else
        # Basic grep fallback
        grep -A3 "\"name\": \"$skill\"" "$json_file" | grep "\"$field\"" | cut -d'"' -f4
    fi
}

# Backup existing skill before update
backup_skill() {
    local skill="$1"
    local skill_path="${SKILLS_DIR}/${skill}"
    local backup_path="${SKILLS_DIR}/.backups/${skill}-$(date +%Y%m%d-%H%M%S)"
    
    if [ -d "$skill_path" ]; then
        mkdir -p "${SKILLS_DIR}/.backups"
        cp -r "$skill_path" "$backup_path"
        echo "Backed up to $backup_path"
    fi
}
