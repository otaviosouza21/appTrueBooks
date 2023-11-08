package com.aplicacaomodelo.core.impl.persistencia;

import com.aplicacaomodelo.domain.EntidadeDominio;
import com.aplicacaomodelo.domain.Livro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO extends AbstractJdbcDAO {

    public LivroDAO(Connection connection, String table, String idTable) {
        super(connection, table, idTable);
    }

    public LivroDAO(String table, String idTable) {
        super("tab_livro", "id_livro");
    }

    public LivroDAO(Connection cx) {
        super(cx, "tab_livro", "id_livro");
    }

    public LivroDAO() {
        super("tab_livro", "id_livro");
    }

    @Override
    public void salvar(EntidadeDominio entidade) throws SQLException {
        if (connection == null) {
            openConnection();
        }
        PreparedStatement pst = null;
        Livro li = (Livro) entidade;

        try {
            connection.setAutoCommit(false);

            StringBuilder sql = new StringBuilder();
            sql.append("INSERT INTO tab_livro (titulo, autor, descricao, tb_padrao, tb_promocao, quantidade) VALUES (?, ?, ?, ?, ?, ?)");

            pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);

            pst.setString(1, li.getTitulo());
            pst.setString(2, li.getAutor());
            pst.setString(3, li.getDescricao());
            pst.setDouble(4, li.getTb_padrao());
            pst.setDouble(5, li.getTb_promocao());
            pst.setInt(6, li.getQuantidade());

            pst.executeUpdate();

            ResultSet rs = pst.getGeneratedKeys();
            int idLivro = 0;
            if (rs.next()) {
                idLivro = rs.getInt(1);
            }

            li.setId(idLivro);

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
        Livro li = (Livro) entidade;

        try {
            connection.setAutoCommit(false);

            StringBuilder sql = new StringBuilder();
            sql.append("UPDATE tab_livro SET titulo = ?, autor = ?, descricao = ?, tb_padrao = ?, tb_promocao = ?, quantidade = ? WHERE id_livro = ?");

            pst = connection.prepareStatement(sql.toString());

            pst.setString(1, li.getTitulo());
            pst.setString(2, li.getAutor());
            pst.setString(3, li.getDescricao());
            pst.setDouble(4, li.getTb_padrao());
            pst.setDouble(5, li.getTb_promocao());
            pst.setInt(6, li.getQuantidade());
            if (li.getId() != null) {
                pst.setInt(7, li.getId());
            } else {
                System.out.println("erro");
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

        List<EntidadeDominio> livros = new ArrayList<>();

        try {
            String sql = "SELECT * FROM tab_livro";

            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Livro li = new Livro();

                li.setId(rs.getInt("id_livro"));
                li.setTitulo(rs.getString("titulo"));
                li.setAutor(rs.getString("autor"));
                li.setDescricao(rs.getString("descricao"));
                li.setTb_padrao(rs.getDouble("tb_padrao"));
                li.setTb_promocao(rs.getDouble("tb_promocao"));
                li.setQuantidade(rs.getInt("quantidade"));

                livros.add(li);
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
        return livros;
    }

    @Override
    public EntidadeDominio visualizar(EntidadeDominio entidade) throws SQLException {

        if (connection == null) {
            openConnection();
        }
        Livro livro = (Livro) entidade;
        livro.setId(0);
        try {

            PreparedStatement ps;
            String sql = "SELECT * FROM tab_livro WHERE nome=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, livro.getTitulo());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                livro.setId(rs.getInt("id_livro"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setDescricao(rs.getString("descricao"));
                livro.setTb_padrao(rs.getDouble("tb_padrao"));
                livro.setTb_promocao(rs.getDouble("tb_promocao"));
                livro.setQuantidade(rs.getInt("quantidade"));
            }

            ps.close();
            rs.close();
            if (ctrlTransaction) {
                connection.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return livro;
    }

    public void excluir(int idLivro) throws SQLException {
        if (connection == null) {
            openConnection();
        }
        PreparedStatement pst = null;

        try {
            connection.setAutoCommit(false);

            String sql = "DELETE FROM tab_livro WHERE id_livro = ?";
            pst = connection.prepareStatement(sql);
            pst.setInt(1, idLivro);
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
