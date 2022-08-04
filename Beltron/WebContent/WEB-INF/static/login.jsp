<div id="modal1" class="modal transparent" style="box-shadow: 0 0 0;">
	<div class="row">
		<div class="col s4 offset-s4">
			<div class="login-betron white">
				<h2 class="login-beltron-title">Beltron</h2>
				<form action="Login" method="POST"> <!-- Enviamos el usuario y contraseña ingresado al Servlet de nombre Login -->
					<div class="row">
						<div class="input-field col s12">
							<input id="last_name" type="text" class="validate" name="usuario" required>
							<label for="last_name">Usuario</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="password" type="password" class="validate" name="contrasena" required>
							<label for="password">Contraseña</label>
						</div>
					</div>
					<button class="btn small teal">Iniciar sesión</button>
				</form>
			</div>
		</div>
	</div>
</div>