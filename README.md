# Social Blocker

A simple bash script that blocks/unblocks websites by modifying your system's `/etc/hosts` file to redirect specified domains to localhost (127.0.0.1).

## How it works

The script modifies your system's hosts file to redirect unwanted websites to localhost, effectively blocking them. When blocking is enabled, the domains listed in your blocklist will be unreachable from your browser and other applications.

## Setup

1. Copy the example blocklist to your home directory:
   ```bash
   cp blocklist.example ~/.blocklist
   ```

2. Edit `~/.blocklist` to customize which sites you want to block:
   ```bash
   vi ~/.blocklist
   ```

3. Make the script executable:
   ```bash
   chmod +x social_block.sh
   ```

## Usage

### Block websites
```bash
./social_block.sh block
```

### Unblock websites
```bash
./social_block.sh unblock
```

## Features

- **Safe operation**: Creates a backup of your hosts file before making changes
- **Clean removal**: Completely removes block entries when unblocking
- **Customizable**: Edit `~/.blocklist` to add or remove domains
- **System-wide blocking**: Works across all browsers and applications

## Default blocked sites

The example blocklist includes popular social media and distraction sites:
- Reddit (reddit.com, www.reddit.com)
- Instagram (instagram.com, www.instagram.com)
- X/Twitter (x.com, www.x.com)
- Facebook (facebook.com, www.facebook.com)
- Nitter (nitter.poast.org)

## Requirements

- macOS or Linux
- sudo privileges (required to modify `/etc/hosts`)

## Notes

- The script requires sudo privileges to modify the system hosts file
- A backup of your original hosts file is created as `/etc/hosts.bak`
- Blocked sites will be completely inaccessible until unblocked