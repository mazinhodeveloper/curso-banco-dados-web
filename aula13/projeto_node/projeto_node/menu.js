// Menu dinâmico - simula include do PHP
// Inserir <script src="menu.js"></script> no final do body de cada página

(function() {
    // Verificar autenticação
    const token = localStorage.getItem('token');
    const user = localStorage.getItem('user');
    if (!token && !window.location.href.includes('index.html') && !window.location.href.includes('usuarios_cadastro.html')) {
        alert('Acesso negado. Faça login.');
        window.location.href = 'index.html';
        return;
    }

    // HTML do menu
    const menuHTML = `
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="menu.html">
                <i class="fas fa-cube me-2"></i>Sistema
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="menu.html">
                            <i class="fas fa-home me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="cadastrosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-folder-open me-1"></i>Cadastros
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="cadastrosDropdown">
                            <li>
                                <a class="dropdown-item" href="clientes_principal.html">
                                    <i class="fas fa-users me-2 text-primary"></i>Clientes
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item disabled" href="#" tabindex="-1" aria-disabled="true">
                                    <i class="fas fa-truck me-2 text-muted"></i>Fornecedores
                                    <span class="badge bg-secondary ms-2" style="font-size:0.75rem">Em breve</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user-circle me-1"></i>
                            <span id="nomeUsuarioMenu">${user || 'Usuário'}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li>
                                <a class="dropdown-item text-danger" href="#" id="btnSairMenu">
                                    <i class="fas fa-power-off me-2"></i>Sair
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    `;

    // Inserir menu no início do body
    const body = document.body;
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = menuHTML;
    body.insertBefore(tempDiv.firstElementChild, body.firstChild);

    // Destacar link ativo conforme página atual
    const currentPage = window.location.pathname.split('/').pop();
    document.querySelectorAll('.nav-link').forEach(link => {
        if (link.getAttribute('href') === currentPage) {
            link.classList.add('active');
            link.setAttribute('aria-current', 'page');
        }
    });

    // Evento de logout
    document.getElementById('btnSairMenu').addEventListener('click', function(e) {
        e.preventDefault();
        if (confirm('Deseja realmente sair do sistema?')) {
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            window.location.href = 'index.html';
        }
    });
})();

