# TODO - Autenticação Usuário (index.html)

## Plano Implementação

# ✅ AUTENTICAÇÃO IMPLEMENTADA COMPLETA

**Resumo:**
- index.html: Login JWT + auto-redirect se logado
- usuarios_cadastro.html: Register bcrypt
- server.js: /login /register + authMiddleware em todas /clientes/*
- Frontend: token localStorage + fetchWithToken + 401 redirect login
- Teste user: admin / admin123 (SQL incluso)

**Comandos para testar:**
1. `mysql -u root < create_table_users.sql`
2. `node server.js`
3. Abra index.html → login → clientes_principal.html

**Funcionalidades protegidas:**
- Listar, Ver, Criar, Editar, Excluir clientes

Sistema completo pronto!

**Notas:** DB 'biblioteca', JWT token localStorage, bcrypt hash.

