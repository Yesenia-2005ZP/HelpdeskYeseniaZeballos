package controlador;

import java.awt.Desktop;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.List;
import javax.swing.JOptionPane;
import modelo.ReporteDao;
import modelo.ReportePDF;
import vista.InterfazPrincipal;

public class ReporteController implements ActionListener {

    private InterfazPrincipal vista;
    private ReporteDao reporteDao;

    public ReporteController(InterfazPrincipal vista) {
        this.vista = vista;
        reporteDao = new ReporteDao();
        
        // 1. Conectamos los botones de la interfaz visual a este controlador
        this.vista.btnIncidencias.addActionListener(this);
        this.vista.btnTecnico.addActionListener(this);
        this.vista.btnCategoria.addActionListener(this);
        
        // Evento opcional si quieres mostrar algo al hacer clic en el panel
        this.vista.panelReportes.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent e) {
                mostrarReportes();
            }
        });
    }

    // EVENTOS
    @Override
    public void actionPerformed(ActionEvent e) {
        // Comparamos directamente con los botones de la vista
        if (e.getSource() == vista.btnIncidencias) {
            generarIncidencias();
        } else if (e.getSource() == vista.btnTecnico) {
            generarTecnicos();
        } else if (e.getSource() == vista.btnCategoria) {
            generarCategorias();
        }
    }

    // REPORTE INCIDENCIAS (Leyendo directo de los ComboBox de la vista)
    private void generarIncidencias() {
        String estado = vista.cmbEstado.getSelectedItem().toString();
        String categoria = vista.cmbCategorias.getSelectedItem().toString();
        List<String[]> datos = reporteDao.reporteIncidencias(estado, categoria);

        if (datos.isEmpty()) {
            JOptionPane.showMessageDialog(vista, "No existen incidencias para los filtros seleccionados.");
            return;
        }

        String archivo = ReportePDF.generarIncidencias(datos, estado, categoria);
        abrirPDF(archivo);
    }

    // REPORTE TÉCNICOS
    private void generarTecnicos() {
        List<String[]> datos = reporteDao.reportePorTecnico();
        String archivo = ReportePDF.generarPorTecnico(datos);
        abrirPDF(archivo);
    }

    // REPORTE CATEGORÍAS
    private void generarCategorias() {
        List<String[]> datos = reporteDao.reportePorCategoria();
        String archivo = ReportePDF.generarPorCategoria(datos);
        abrirPDF(archivo);
    }

    // ABRIR PDF
    private void abrirPDF(String archivo) {
        if (archivo == null) {
            JOptionPane.showMessageDialog(vista, "No se pudo generar el reporte.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        try {
            File pdf = new File(archivo);
            Desktop.getDesktop().open(pdf);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(vista, "El reporte fue generado en:\n" + archivo);
        }
    }

    private void mostrarReportes() {
        vista.panelReportes.setVisible(true);
        vista.panelReportes.revalidate();
        vista.panelReportes.repaint();
    }

}