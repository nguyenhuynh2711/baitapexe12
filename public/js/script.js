// Hàm để lấy danh sách người dùng từ localStorage
function getUsers() {
    const users = JSON.parse(localStorage.getItem('users')) || [];
    return users;
}

// Hàm để lưu danh sách người dùng vào localStorage
function saveUsers(users) {
    localStorage.setItem('users', JSON.stringify(users));
}

// Hàm để tìm người dùng theo username
function findUser(username) {
    return getUsers().find(user => user.username === username);
}

// Hàm để xóa người dùng theo username
function deleteUser(username) {
    const users = getUsers().filter(user => user.username !== username);
    saveUsers(users);
}

// Trang register.html
if (document.getElementById('registerForm')) {
    document.getElementById('registerForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm_password').value;
        const email = document.getElementById('email').value;

        if (password !== confirmPassword) {
            alert('Mật khẩu không khớp!');
            return;
        }

        if (findUser(username)) {
            alert('Tên người dùng đã tồn tại!');
            return;
        }

        const newUser = { username, password, email };
        const users = getUsers();
        users.push(newUser);
        saveUsers(users);

        alert('Đăng ký thành công!');
        window.location.href = 'login.html'; // Chuyển hướng đến trang đăng nhập
    });
}

// Trang login.html
if (document.getElementById('loginForm')) {
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        const user = findUser(username);

        if (user && user.password === password) {
            alert('Đăng nhập thành công!');
            window.location.href = 'list.html'; // Chuyển hướng đến trang danh sách
        } else {
            alert('Tên người dùng hoặc mật khẩu không đúng!');
        }
    });
}

// Trang list.html
if (document.getElementById('userList')) {
    const usersPerPage = 5;
    let currentPage = 1;

    function displayUsers() {
        const userList = document.getElementById('userList');
        userList.innerHTML = '';

        const users = getUsers();
        const startIndex = (currentPage - 1) * usersPerPage;
        const endIndex = startIndex + usersPerPage;
        const currentPageUsers = users.slice(startIndex, endIndex);

        currentPageUsers.forEach(user => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${users.indexOf(user) + 1}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>
                    <a href="update.html?username=${user.username}">Edit</a> |
                    <a href="view.html?username=${user.username}">View</a> |
                    <a href="#" class="delete-user" data-username="${user.username}">Delete</a>
                </td>
            `;
            userList.appendChild(row);
        });

        document.getElementById('currentPage').textContent = currentPage;

        // Xử lý sự kiện xóa người dùng
        const deleteButtons = document.querySelectorAll('.delete-user');
        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const username = this.dataset.username;
                if (confirm('Bạn có chắc chắn muốn xóa người dùng này?')) {
                    deleteUser(username);
                    displayUsers();
                }
            });
        });
    }

    document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            displayUsers();
        }
    });

    document.getElementById('nextPage').addEventListener('click', () => {
        const users = getUsers();
        if (currentPage * usersPerPage < users.length) {
            currentPage++;
            displayUsers();
        }
    });

    displayUsers();
}

// Trang update.html
if (document.getElementById('updateForm')) {
    const urlParams = new URLSearchParams(window.location.search);
    const username = urlParams.get('username');
    const user = findUser(username);

    if (user) {
        document.getElementById('username').value = user.username;
        document.getElementById('password').value = user.password;
        document.getElementById('confirm_password').value = user.password;
        document.getElementById('email').value = user.email;
    }

    document.getElementById('updateForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const newUsername = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm_password').value;
        const email = document.getElementById('email').value;

        if (password !== confirmPassword) {
            alert('Mật khẩu không khớp!');
            return;
        }

        const users = getUsers();
        const userIndex = users.findIndex(u => u.username === username);

        if (userIndex !== -1) {
            users[userIndex] = { username: newUsername, password, email };
            saveUsers(users);
            alert('Cập nhật thông tin thành công!');
            window.location.href = 'list.html'; // Chuyển hướng về trang list
        } else {
            alert('Không tìm thấy người dùng!');
        }
    });
}

// Trang view.html
if (document.querySelector('.view-box')) {
    const urlParams = new URLSearchParams(window.location.search);
    const username = urlParams.get('username');
    const user = findUser(username);

    if (user) {
        document.getElementById('username').textContent = user.username;
        document.getElementById('email').textContent = user.email;

        document.getElementById('editButton').addEventListener('click', () => {
            window.location.href = `update.html?username=${user.username}`;
        });
    } else {
        alert('Không tìm thấy người dùng!');
        window.location.href = 'list.html';
    }
}