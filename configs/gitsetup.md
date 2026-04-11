# Git Multi-Account Setup (HTTPS + PAT)

This guide explains how to use **two different GitHub accounts on the same Linux machine** using HTTPS and Personal Access Tokens (PAT), with complete isolation.

---

## Overview

* Personal account → uses global credential storage
* UGV account → uses separate credential file
* No conflicts between accounts

---

## Prerequisites

* Two GitHub accounts
* PAT (Personal Access Token) for each account

---

## Step 1: Generate PAT (for both accounts)

On GitHub:

* Settings → Developer settings → Personal access tokens → Tokens (classic)
* Generate new token
* Select `repo` scope (or all if needed)
* Copy token

---

## Step 2: Clean existing credentials (important)

```bash
rm ~/.git-credentials
rm ~/.git-credentials-ugv
```

---

## Step 3: Disable global helper temporarily (critical)

```bash
git config --global --unset credential.helper
```

This prevents Git from reusing or writing credentials to the wrong file during setup.

---

## Step 4: Setup UGV account FIRST (important order)

```bash
cd ~/ugv/mercury
```

Set repo-specific credential file:

```bash
git config credential.helper "store --file ~/.git-credentials-ugv"
```

Push to authenticate:

```bash
GIT_TERMINAL_PROMPT=1 git push
```

Enter:

```
Username: ugv-dtu
Password: <UGV PAT>
```

Verify:

```bash
cat ~/.git-credentials-ugv
```

---

## Step 4: Enable global helper for personal account

```bash
git config --global credential.helper store
```

---

## Step 5: Setup personal account

```bash
cd ~/probes/dakshhpanchal
```

Push:

```bash
git push
```

Enter:

```
Username: dakshhpanchal
Password: <PERSONAL PAT>
```

Verify:

```bash
cat ~/.git-credentials
```

---

## Final Structure

### Personal

```
~/.git-credentials
→ dakshhpanchal
```

### UGV

```
~/.git-credentials-ugv
→ ugv-dtu
```

---

## Required Remote URL Format

### Personal repos

```
https://github.com/username/repo.git
```

### UGV repos (must include username)

```
https://ugv-dtu@github.com/ugv-dtu/repo.git
```

---

## Key Rules

* Always setup UGV account first when resetting
* Do not mix credential helpers between repos
* Do not use password, always use PAT
* Do not clone UGV repos without username in URL

---

## Debug Commands

Check active credential helper:

```bash
git config --show-origin credential.helper
```

Check remotes:

```bash
git remote -v
```

Check stored credentials:

```bash
cat ~/.git-credentials
cat ~/.git-credentials-ugv
```

---

## Common Issues

### Wrong account used

* Credentials mixed in same file
* Fix: delete credential files and redo setup

### Authentication error

* Using password instead of PAT

### Permission denied

* Account does not have access to repo

---

## Result

* Two GitHub accounts working on same system
* Fully isolated credentials
* No conflicts during push/pull
