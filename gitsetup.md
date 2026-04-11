# Git Multi-Account Setup using PAT (HTTPS)

---

## A. Personal Account Setup

### 1. Create PAT (Classic)

* Go to: Settings → Developer settings → Personal access tokens → Tokens (classic)
* Generate new token
* Select scopes: `repo` (or all if needed)
* Copy the token

---

### 2. Configure Git (Global)

```bash
git config --global user.name "dakshhpanchal"
git config --global user.email "dakshpanchal08@gmail.com"
git config --global credential.helper store
```

---

### 3. Clone Repository

```bash
cd ~/myproject
git clone https://github.com/yourusername/yourrepo.git
cd yourrepo
```

---

### 4. Push (Authenticate using PAT)

```bash
git push
```

Enter:

```
Username: dakshhpanchal
Password: <paste your GitHub Personal Access Token>
```

---

## B. UGV / Second Account Setup

### 1. Create PAT (Classic)

* Same steps as above
* Use second account
* Copy the token

---

### 2. Clone Repository (with username in URL)

```bash
cd ~/ugv
git clone https://ugv-dtu@github.com/ugv-dtu/mercury.git
cd mercury
```

---

### 3. Configure Repo Identity

```bash
git config user.name "ugv"
git config user.email "ugv@dtu.ac.in"
```

---

### 4. Use Separate Credential File

```bash
git config credential.helper "store --file ~/.git-credentials-ugv"
```

---

### 5. Push (Authenticate using PAT)

```bash
git push
```

Enter:

```
Username: ugv-dtu
Password: <paste your GitHub Personal Access Token>
```

---

## Final Setup Summary

* Personal account → `~/.git-credentials`
* UGV account → `~/.git-credentials-ugv`
* Accounts are isolated
* No credential conflicts

---

## Important Rules

* Personal repos:

```
https://github.com/...
```

* UGV repos (must include username):

```
https://ugv-dtu@github.com/...
```

* Always use PAT instead of password
