package com.aplicacaomodelo.core.impl.persistencia;

import com.aplicacaomodelo.domain.EntidadeDominio;
import com.aplicacaomodelo.domain.Livro;
import com.aplicacaomodelo.domain.Pessoa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class PessoaDAO extends AbstractJdbcDAO {

    public PessoaDAO(Connection connection, String table, String idTable) {
        super(connection, table, idTable);
    }

    public PessoaDAO(String table, String idTable) {
        super("tab_pessoa", "id_pessoa");
    }

    public PessoaDAO(Connection cx) {
        super(cx, "tab_pessoa", "id_pessoa");
    }

    public PessoaDAO() {
        super("tab_pessoa", "id_pessoa");
    }

    @Override
    public void salvar(EntidadeDominio entidade) throws SQLException {
        if (connection == null) {
            openConnection();
        }
        PreparedStatement pst = null;
        Pessoa p = (Pessoa) entidade;

        try {
            connection.setAutoCommit(false);

            StringBuilder sql = new StringBuilder();
            sql.append("INSERT INTO tab_pessoa (nome_comp, email, endereco, bairro, cidade, dt_nascimento, cep, celular, complemento, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);

            pst.setString(1, p.getNome_comp());
            pst.setString(2, p.getEmail());
            pst.setString(3, p.getEndereco());
            pst.setString(4, p.getBairro());
            pst.setString(5, p.getCidade());
            pst.setDate(6, new java.sql.Date(p.getDt_nascimento().getTime()));
            pst.setString(7, p.getCep());
            pst.setString(8, p.getCelular());
            pst.setString(9, p.getComplemento());
            pst.setString(10, p.getEstado());

            pst.executeUpdate();

            ResultSet rs = pst.getGeneratedKeys();
            int idPessoa = 0;
            if (rs.next()) {
                idPessoa = rs.getInt(1);
            }

            p.setId(idPessoa);

            connection.commit();

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                pst.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void alterar(EntidadeDominio entidade) throws SQLException {

        if (connection == null) {
            openConnection();
        }
        PreparedStatement pst = null;
        Pessoa p = (Pessoa) entidade;

        try {
            connection.setAutoCommit(false);

            StringBuilder sql = new StringBuilder();
            sql.append("UPDATE tab_pessoa SET nome_comp = ?, email = ?, endereco = ?, bairro = ?, cidade = ?, dt_nascimento = ?, cep = ?, celular = ?, complemento = ?, estado = ? WHERE id_pessoa = ?");

            pst = connection.prepareStatement(sql.toString());

            pst.setString(1, p.getNome_comp());
            pst.setString(2, p.getEmail());
            pst.setString(3, p.getEndereco());
            pst.setString(4, p.getBairro());
            pst.setString(5, p.getCidade());
            pst.setDate(6, new java.sql.Date(p.getDt_nascimento().getTime()));
            pst.setString(7, p.getCep());
            pst.setString(8, p.getCelular());
            pst.setString(9, p.getComplemento());
            pst.setString(10, p.getEstado());

            Integer id = p.getId();
            if (id != null) {
                pst.setInt(11, id.intValue());
            } else {
                // Trate a situação em que o ID é nulo
                // Aqui você pode lançar uma exceção, imprimir uma mensagem ou fazer o que for apropriado para o seu caso.
                System.out.println("ID do livro é nulo.");
                // Ou você pode simplesmente retornar sem executar a atualização, dependendo do comportamento desejado.
                return;
            }

            pst.executeUpdate();

            connection.commit();

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                pst.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
        if (connection == null) {
            openConnection();
        }
        PreparedStatement ps = null;

        List<EntidadeDominio> pessoas = new ArrayList<>();

        try {
            String sql = "SELECT * FROM tab_pessoa";

            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Pessoa p = new Pessoa();

                p.setId(rs.getInt("id_pessoa"));
                p.setNome_comp(rs.getString("nome_comp"));
                p.setEmail(rs.getString("email"));
                p.setEndereco(rs.getString("endereco"));
                p.setBairro(rs.getString("bairro"));
                p.setCidade(rs.getString("cidade"));

                Calendar cal = GregorianCalendar.getInstance();
                cal.setTime(rs.getDate("dt_nascimento"));

                p.setDt_nascimento(cal.getTime());

                p.setCep(rs.getString("cep"));
                p.setCelular(rs.getString("celular"));
                p.setComplemento(rs.getString("complemento"));
                p.setEstado(rs.getString("estado"));

                pessoas.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
                if (ctrlTransaction) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return pessoas;
    }

    @Override
    public EntidadeDominio visualizar(EntidadeDominio entidade) throws SQLException {

        if (connection == null) {
            openConnection();
        }
        Pessoa pessoa = (Pessoa) entidade;
        pessoa.setId(0);
        try {

            PreparedStatement ps;
            String sql = "SELECT * FROM tab_pessoa WHERE nome=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, pessoa.getNome_comp());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                pessoa.setId(rs.getInt("id_pessoa"));
                pessoa.setNome_comp(rs.getString("nome_comp"));
                pessoa.setEmail(rs.getString("email"));
                pessoa.setEndereco(rs.getString("endereco"));
                pessoa.setBairro(rs.getString("bairro"));
                pessoa.setCidade(rs.getString("cidade"));

                pessoa.setDt_nascimento(rs.getDate("dt_nascimento"));

                pessoa.setCep(rs.getString("cep"));
                pessoa.setCelular(rs.getString("celular"));
                pessoa.setComplemento(rs.getString("complemento"));
                pessoa.setEstado(rs.getString("estado"));
            }

            ps.close();
            rs.close();
            if (ctrlTransaction) {
                connection.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pessoa;
    }

    public void excluir(int idPessoa) throws SQLException {
        if (connection == null) {
            openConnection();
        }
        PreparedStatement pst = null;

        try {
            connection.setAutoCommit(false);

            String sql = "DELETE FROM tab_pessoa WHERE id_pessoa = ?";
            pst = connection.prepareStatement(sql);
            pst.setInt(1, idPessoa);
            pst.executeUpdate();

            connection.commit();

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (connection != null && ctrlTransaction) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
