
package SlackIntegration;
import com.github.seratch.jslack.*;
import com.github.seratch.jslack.api.webhook.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Message {
    
    public void sendMessage(String alerta){
        String timeStamp = new SimpleDateFormat("dd-MM-yyyy | HH:mm").format(Calendar.getInstance().getTime());
        // https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX
        String url = "https://hooks.slack.com/services/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";

        Payload payload = Payload.builder()
          .channel("#pyx")
          .username("jSlack Bot")
          //.iconEmoji(":smile_cat:")
          .text(alerta + " | " + timeStamp)
          .build();

        Slack slack = Slack.getInstance();
        try {
            WebhookResponse response = slack.send(url, payload);
            // response.code, response.message, response.body
        } catch (IOException ex) {
            Logger.getLogger(Message.class.getName()).log(Level.SEVERE, null, ex);
        }
}
    
}
