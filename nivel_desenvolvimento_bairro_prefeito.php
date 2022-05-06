    	<?php
			require_once("../../config/config.php");
			require_once("../../comum/funcoes.php");
			$conexao=conectar($dados_conexao);
			$consulta = "
			SELECT bairro.nome AS `bairro`, bairro.regiao, bairro.nv_desenvolvimento, prefeitura.cidade, prefeitura.inicio, prefeitura.prefeito
			FROM bairro, prefeitura
            WHERE bairro.id_prefeitura=prefeitura.id 
			";
			$resultado_consulta = mysqli_query($conexao, $consulta);
			if (!$resultado_consulta){
			sair("Consulta inválida: ".mysqli_error($conexao), $conexao);
			}
			echo "<table class='tabela_resultado'>";
			echo "<tr><th>Bairro</th><th>Regiao</th><th>Nv. Desenvolvimento</th><th>Cidade</th><th>Inicio Mandato</th><th>Prefeito</th>";
			while ($linha = mysqli_fetch_assoc($resultado_consulta)){
			echo "<tr>";
			echo "<td>".$linha["nome"]."</td><td>". $linha["regiao"]."</td><td>". $linha["nv_desenvolvimento"]."</td><td>". $linha["cidade"]."</td><td>". $linha["inicio"]."</td><td>". $linha["prefeito"]."</td>";
			echo "<tr>";
			}
			echo "</table>"
		?>
		</div>
		<br>
		<?PHP require_once("footer.html"); ?>		
	</body>
	<script type="text/javascript" src="js/javascript.js"></script>
</html>