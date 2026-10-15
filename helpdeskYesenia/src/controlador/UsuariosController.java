package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import modelo.Usuarios;
import modelo.UsuariosDao;
import vista.InterfazPrincipal;

public class UsuariosController implements ActionListener, MouseListener, KeyListener {

    // Encapsular variables
    private Usuarios usuarios;
    private UsuariosDao usuariosDao;
    private InterfazPrincipal interfazPrincipal;

    DefaultTableModel model = new DefaultTableModel();

    // Constructor
    public UsuariosController(Usuarios usuarios, UsuariosDao usuariosDao,
            InterfazPrincipal interfazPrincipal) {

        this.usuarios = usuarios;
        this.usuariosDao = usuariosDao;
        this.interfazPrincipal = interfazPrincipal;

        // Botón Registrar Usuario
        this.interfazPrincipal.btn_registrar_usuarios.addActionListener(this);

        // Tabla
        this.interfazPrincipal.tabla_Usuarios.addMouseListener(this);

        // Buscador
        this.interfazPrincipal.txt_buscar_ususarios.addKeyListener(this);

        // Modificar
        this.interfazPrincipal.btn_modificar_usuarios.addActionListener(this);

        // Eliminar
        this.interfazPrincipal.btn_eliminar_usuarios.addActionListener(this);

        // Cancelar
        this.interfazPrincipal.btn_cancelar_usuarios.addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // REGISTRAR USUARIO
        if (e.getSource() == interfazPrincipal.btn_registrar_usuarios) {

            if (interfazPrincipal.txt_usuarios_NombreCompleto.getText().equals("")
                    || interfazPrincipal.txt_usuarios_direccion.getText().equals("")
                    || interfazPrincipal.txt_usuarios_telefono.getText().equals("")
                    || interfazPrincipal.txt_usuarios_correo.getText().equals("")) {

                JOptionPane.showMessageDialog(
                        null,
                        "Todos los campos son obligatorios"
                );

            } else {

                usuarios.setNombrecompleto(
                        interfazPrincipal.txt_usuarios_NombreCompleto
                                .getText().trim()
                );

                usuarios.setDireccion(
                        interfazPrincipal.txt_usuarios_direccion
                                .getText().trim()
                );

                usuarios.setTelefono(
                        interfazPrincipal.txt_usuarios_telefono
                                .getText().trim()
                );

                usuarios.setCorreo(
                        interfazPrincipal.txt_usuarios_correo
                                .getText().trim()
                );

                if (usuariosDao.registrarUsuariosQuery(usuarios)) {

                    cleanTabla();
                    listarUsuarios();
                    cleanFields();

                    JOptionPane.showMessageDialog(
                            null,
                            "Usuario registrado con éxito"
                    );

                } else {

                    JOptionPane.showMessageDialog(
                            null,
                            "Ha ocurrido un error al registrar el usuario"
                    );
                }
            }

        // ACTUALIZAR USUARIO
        } else if (e.getSource() == interfazPrincipal.btn_modificar_usuarios) {

            if (interfazPrincipal.txt_usuarios_id.getText().equals("")) {

                JOptionPane.showMessageDialog(
                        null,
                        "Selecciona una fila para continuar"
                );

            } else if (interfazPrincipal.txt_usuarios_NombreCompleto.getText().equals("")
                    || interfazPrincipal.txt_usuarios_direccion.getText().equals("")
                    || interfazPrincipal.txt_usuarios_telefono.getText().equals("")
                    || interfazPrincipal.txt_usuarios_correo.getText().equals("")) {

                JOptionPane.showMessageDialog(
                        null,
                        "Todos los campos son obligatorios"
                );

            } else {

                usuarios.setId(
                        Integer.parseInt(
                                interfazPrincipal.txt_usuarios_id
                                        .getText().trim()
                        )
                );

                usuarios.setNombrecompleto(
                        interfazPrincipal.txt_usuarios_NombreCompleto
                                .getText().trim()
                );

                usuarios.setDireccion(
                        interfazPrincipal.txt_usuarios_direccion
                                .getText().trim()
                );

                usuarios.setTelefono(
                        interfazPrincipal.txt_usuarios_telefono
                                .getText().trim()
                );

                usuarios.setCorreo(
                        interfazPrincipal.txt_usuarios_correo
                                .getText().trim()
                );

                if (usuariosDao.actualizarUsuariosQuery(usuarios)) {

                    cleanTabla();
                    listarUsuarios();
                    cleanFields();

                    JOptionPane.showMessageDialog(
                            null,
                            "Datos del usuario modificados con éxito"
                    );

                } else {

                    JOptionPane.showMessageDialog(
                            null,
                            "Ha ocurrido un error al modificar usuario"
                    );
                }
            }

        // ELIMINAR USUARIO
        } else if (e.getSource() == interfazPrincipal.btn_eliminar_usuarios) {

            int row = interfazPrincipal.tabla_Usuarios.getSelectedRow();

            if (row == -1) {

                JOptionPane.showMessageDialog(
                        null,
                        "Debes seleccionar un usuario para eliminar"
                );

            } else {

                int id = Integer.parseInt(
                        interfazPrincipal.tabla_Usuarios
                                .getValueAt(row, 0)
                                .toString()
                );

                int question = JOptionPane.showConfirmDialog(
                        null,
                        "¿Realmente quieres eliminar este usuario?",
                        "Eliminar usuario",
                        JOptionPane.YES_NO_OPTION
                );

                if (question == JOptionPane.YES_OPTION) {

                    if (usuariosDao.eliminarUsuariosQuery(id)) {

                        cleanFields();
                        cleanTabla();
                        listarUsuarios();

                        interfazPrincipal.btn_registrar_usuarios
                                .setEnabled(true);

                        JOptionPane.showMessageDialog(
                                null,
                                "Usuario eliminado con éxito"
                        );
                    }
                }
            }

        // CANCELAR
        } else if (e.getSource() == interfazPrincipal.btn_cancelar_usuarios) {

            interfazPrincipal.btn_registrar_usuarios.setEnabled(true);

            cleanFields();
        }
    }

    // LIMPIAR CAMPOS
    public void cleanFields() {

        interfazPrincipal.txt_usuarios_id.setText("");
        interfazPrincipal.txt_usuarios_id.setEditable(true);

        interfazPrincipal.txt_usuarios_NombreCompleto.setText("");
        interfazPrincipal.txt_usuarios_direccion.setText("");
        interfazPrincipal.txt_usuarios_telefono.setText("");
        interfazPrincipal.txt_usuarios_correo.setText("");
    }
    // LISTAR USUARIOS
    public void listarUsuarios() {

        List<Usuarios> list = usuariosDao.listaUsuariosQuery(
                interfazPrincipal.txt_buscar_ususarios.getText()
        );

        model = (DefaultTableModel)
                interfazPrincipal.tabla_Usuarios.getModel();

        Object[] row = new Object[5];

        for (int i = 0; i < list.size(); i++) {

            row[0] = list.get(i).getId();
            row[1] = list.get(i).getNombrecompleto();
            row[2] = list.get(i).getTelefono();
            row[3] = list.get(i).getDireccion();
            row[4] = list.get(i).getCorreo();

            model.addRow(row);
        }

        interfazPrincipal.tabla_Usuarios.setModel(model);
    }
    // CLICK EN TABLA
    @Override
    public void mouseClicked(MouseEvent e) {

        if (e.getSource() == interfazPrincipal.tabla_Usuarios) {

            int row = interfazPrincipal.tabla_Usuarios
                    .rowAtPoint(e.getPoint());

            if (row >= 0) {

                interfazPrincipal.txt_usuarios_id.setText(
                        interfazPrincipal.tabla_Usuarios
                                .getValueAt(row, 0)
                                .toString()
                );

                interfazPrincipal.txt_usuarios_NombreCompleto.setText(
                        interfazPrincipal.tabla_Usuarios
                                .getValueAt(row, 1)
                                .toString()
                );

                interfazPrincipal.txt_usuarios_telefono.setText(
                        interfazPrincipal.tabla_Usuarios
                                .getValueAt(row, 2)
                                .toString()
                );

                interfazPrincipal.txt_usuarios_direccion.setText(
                        interfazPrincipal.tabla_Usuarios
                                .getValueAt(row, 3)
                                .toString()
                );

                interfazPrincipal.txt_usuarios_correo.setText(
                        interfazPrincipal.tabla_Usuarios
                                .getValueAt(row, 4)
                                .toString()
                );

                interfazPrincipal.btn_registrar_usuarios
                        .setEnabled(false);

                interfazPrincipal.txt_usuarios_id
                        .setEditable(false);
            }
        }
    }

    @Override
    public void mousePressed(MouseEvent e) {
    }

    @Override
    public void mouseReleased(MouseEvent e) {
    }

    @Override
    public void mouseEntered(MouseEvent e) {
    }

    @Override
    public void mouseExited(MouseEvent e) {
    }
    // TECLADO
   
    @Override
    public void keyTyped(KeyEvent e) {
    }

    @Override
    public void keyPressed(KeyEvent e) {
    }

    @Override
    public void keyReleased(KeyEvent e) {

        if (e.getSource() == interfazPrincipal.txt_buscar_ususarios) {

            cleanTabla();
            listarUsuarios();
        }
    }

 
    // LIMPIAR TABLA
    
    public void cleanTabla() {

        for (int i = model.getRowCount() - 1; i >= 0; i--) {
            model.removeRow(i);
        }
    }
}

