package examples.Runner;
import com.intuit.karate.junit5.Karate;

class UsersRunner {
    static {
        System.setProperty("karate.env", "QA");
    }

    @Karate.Test
    Karate testUsers() {
        return Karate.
                //run("features/No1-FusoExample").relativeTo(getClass());
        // run("features/No2-graphql").relativeTo(getClass());
        //run("features/No3-JavaAndJS").relativeTo(getClass());
        //run("features/No4-outline").relativeTo(getClass()).tags("prod");
        // run("features/ManagememberPage").relativeTo(getClass());
                run("features/feature1").relativeTo(getClass());
    }


}
