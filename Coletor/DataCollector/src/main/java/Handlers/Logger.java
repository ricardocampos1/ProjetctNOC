package Handlers;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/*@author Pyxia*/
public class Logger {

    String caminhoDoArquivo = "C:\\Pyxia";
    File arquivo;
    FileReader fileReader; //pesquisa
    BufferedReader bufferedReader;
    FileWriter fileWriter;
    BufferedWriter bufferedWriter;

    File arq;

    String time = new SimpleDateFormat("MM-YYYY").format(Calendar.getInstance().getTime());
    String timeStamp = new SimpleDateFormat("dd-MM-yyyy__HH.mm").format(Calendar.getInstance().getTime());

    public void LogTxt(String logs) throws IOException {
        //objeto que insere a data no nome do arquivo txt, isso irá mudar o arquivo
        //de acordo com o dia
        String dataArq = new SimpleDateFormat("dd-MM-yyyy").format(new Date());

        //cria o arquivo txt, escreve e grava(close).
        //true para não apagar(subescrever)o que ja esta escrito no arq. 
        boolean pathExist = new File("C:\\Pyxia").exists();
        if (pathExist) {
            BufferedWriter writer = new BufferedWriter(new FileWriter(caminhoDoArquivo + "\\log - " + dataArq + ".txt", true));
            writer.write("\n" + logs);//escreve no arquivo.
            writer.close(); //fechar o arq.
        } else {
            new File(caminhoDoArquivo).mkdirs();
            BufferedWriter writer = new BufferedWriter(new FileWriter(caminhoDoArquivo + "\\log - " + dataArq + ".txt", true));
            writer.write("\n" + logs);//escreve no arquivo.
            writer.close(); //fechar o arq.
        }

        //Exemplo de como você deve chamar o metodo em outras classes:
        //arq.LogTxt(quebraLinha + data2 + hora2 +);
        //ex-->>exçao
    }

}
