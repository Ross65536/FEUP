package gui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import gameLogic.GameConfig;
import gameLogic.GameLogic;
import gameLogic.Level;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

import javax.swing.JComboBox;
import javax.swing.JButton;
import javax.swing.JTextArea;
import java.awt.Font;
import java.awt.Color;
import javax.swing.JPanel;
import java.awt.SystemColor;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class WindowBuilder {

	private JFrame Game;
	private JTextField txtInsertNumber;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					WindowBuilder window = new WindowBuilder();
					window.Game.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public WindowBuilder() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		Game = new JFrame();
		Game.setResizable(false);
		Game.setTitle("DungeonKeep");
		Game.setBounds(100, 100, 450, 300);
		Game.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Game.getContentPane().setLayout(null);
		
		JLabel lblHowManyOgres = new JLabel("How many Ogres? (1 / 2 / 3)");
		lblHowManyOgres.setBounds(24, 21, 147, 14);
		Game.getContentPane().add(lblHowManyOgres);
		
		txtInsertNumber = new JTextField();
		txtInsertNumber.setBounds(181, 18, 31, 20);
		Game.getContentPane().add(txtInsertNumber);
		txtInsertNumber.setColumns(10);
		
		JLabel lblGuardPersonality = new JLabel("Guard Personality?");
		lblGuardPersonality.setBounds(24, 57, 92, 14);
		Game.getContentPane().add(lblGuardPersonality);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setBounds(136, 54, 76, 20);
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(3);
		comboBox.setToolTipText(" ");
		comboBox.addItem("Rookie");
		comboBox.addItem("Drunken");
		comboBox.addItem("Suspicius");
		Game.getContentPane().add(comboBox);
		
		JButton btnNewGame = new JButton("New Game");
		btnNewGame.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				GameConfig game = new GameConfig();
				Level l1 = new Level(1);
				GameLogic g = new GameLogic(l1, game);
			}
		});
		btnNewGame.setBounds(313, 34, 89, 23);
		Game.getContentPane().add(btnNewGame);
		
		JButton btnExitGame = new JButton("Exit Game");
		btnExitGame.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnExitGame.setBounds(313, 219, 107, 23);
		Game.getContentPane().add(btnExitGame);
		
		JButton btnUp = new JButton("Up");
		btnUp.setBounds(325, 88, 59, 23);
		btnUp.setEnabled(false);
		Game.getContentPane().add(btnUp);
		
		JButton btnRight = new JButton("Right");
		btnRight.setBounds(361, 122, 59, 23);
		btnRight.setEnabled(false);
		Game.getContentPane().add(btnRight);
		
		JButton btnDown = new JButton("Down");
		btnDown.setBounds(325, 156, 59, 23);
		btnDown.setEnabled(false);
		Game.getContentPane().add(btnDown);
		
		JButton btnLeft = new JButton("Left");
		btnLeft.setBounds(292, 121, 59, 23);
		btnLeft.setEnabled(false);
		Game.getContentPane().add(btnLeft);
		
		JTextArea txtrGameStatus = new JTextArea();
		txtrGameStatus.setBackground(SystemColor.menu);
		txtrGameStatus.setBounds(24, 238, 231, 22);
		txtrGameStatus.setForeground(Color.BLACK);
		txtrGameStatus.setEditable(false);
		txtrGameStatus.setFont(new Font("Courier New", Font.PLAIN, 13));
		txtrGameStatus.setText("You can start a new game.");
		Game.getContentPane().add(txtrGameStatus);
		
		JTextArea textArea = new JTextArea();
		textArea.setBounds(24, 87, 231, 147);
		Game.getContentPane().add(textArea);
		
		PrintStream out = new PrintStream( new TextAreaOutputStream( textArea) );
		System.setOut(out);
		System.setErr(out);
		System.out.println("Hello Word");
	}
}
