package org.scorelab.scorelab;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    public DrawerLayout mDrawerLayout;
    Button drawerButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        getSupportFragmentManager().beginTransaction().replace(R.id.frame_layout_main_Activity, new aboutFragment()).commit();

        mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawerButton = (Button) findViewById(R.id.drawer_button);
        drawerButton.setOnClickListener(
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        mDrawerLayout.openDrawer(Gravity.START);
                    }
                }
        );

        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(
                new NavigationView.OnNavigationItemSelectedListener() {
                    @Override
                    public boolean onNavigationItemSelected(MenuItem menuItem) {
                        menuItem.setChecked(true);
                        mDrawerLayout.closeDrawers();
                        switch (menuItem.getItemId()) {
                            case R.id.nav_about:
                                getSupportFragmentManager().beginTransaction().replace(R.id.frame_layout_main_Activity, new aboutFragment()).commit();
                                return true;
                            case R.id.nav_repo:
                                getSupportFragmentManager().beginTransaction().replace(R.id.frame_layout_main_Activity, new repoFragment()).commit();
                                return true;
                            case R.id.nav_web:
                                String urlString = "http://www.scorelab.org/";
                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString));
                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                intent.setPackage("com.android.chrome");
                                try {
                                    MainActivity.this.startActivity(intent);
                                } catch (ActivityNotFoundException ex) {
                                    // Chrome browser presumably not installed so allow user to choose instead
                                    intent.setPackage(null);
                                    MainActivity.this.startActivity(intent);
                                }
                                return false;
                            case R.id.nav_github:
                                String urlString2 = "https://github.com/scorelab";
                                Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString2));
                                intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                intent2.setPackage("com.android.chrome");
                                try {
                                    MainActivity.this.startActivity(intent2);
                                } catch (ActivityNotFoundException ex) {
                                    // Chrome browser presumably not installed so allow user to choose instead
                                    intent2.setPackage(null);
                                    MainActivity.this.startActivity(intent2);
                                }
                                return false;
                            case R.id.nav_contact_email:
                                String[] TO = {"info@scorelab.org"};
                                Intent emailIntent = new Intent(Intent.ACTION_SEND);

                                emailIntent.setData(Uri.parse("mailto:"));
                                emailIntent.setType("text/plain");
                                emailIntent.putExtra(Intent.EXTRA_EMAIL, TO);
                                emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Hey SCoReLab");
                                emailIntent.putExtra(Intent.EXTRA_TEXT, "Sent from SCoReLab App");

                                try {
                                    startActivity(Intent.createChooser(emailIntent, "Send mail..."));
                                    finish();
                                } catch (android.content.ActivityNotFoundException ex) {
                                    Toast.makeText(MainActivity.this, "There is no email client installed.", Toast.LENGTH_SHORT).show();
                                }
                                return false;
                            case R.id.nav_contact_gitter:
                                String urlString4 = "https://gitter.im/scorelab/scorelab";
                                Intent intent4 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString4));
                                intent4.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                intent4.setPackage("com.android.chrome");
                                try {
                                    MainActivity.this.startActivity(intent4);
                                } catch (ActivityNotFoundException ex) {
                                    // Chrome browser presumably not installed so allow user to choose instead
                                    intent4.setPackage(null);
                                    MainActivity.this.startActivity(intent4);
                                }
                                return false;
                            default:
                                getSupportFragmentManager().beginTransaction().replace(R.id.frame_layout_main_Activity, new aboutFragment()).commit();
                                return true;
                        }
                    }
                });
    }

    public void gotoBassa(View view) {
        String urlString2 = "https://github.com/scorelab/Bassa";
        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString2));
        intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent2.setPackage("com.android.chrome");
        try {
            MainActivity.this.startActivity(intent2);
        } catch (ActivityNotFoundException ex) {
            // Chrome browser presumably not installed so allow user to choose instead
            intent2.setPackage(null);
            MainActivity.this.startActivity(intent2);
        }
    }

    public void gotoDroneSym(View view) {
        String urlString2 = "https://github.com/scorelab/DroneSym";
        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString2));
        intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent2.setPackage("com.android.chrome");
        try {
            MainActivity.this.startActivity(intent2);
        } catch (ActivityNotFoundException ex) {
            // Chrome browser presumably not installed so allow user to choose instead
            intent2.setPackage(null);
            MainActivity.this.startActivity(intent2);
        }
    }

    public void gotoKute(View view) {
        String urlString2 = "https://github.com/scorelab/kute";
        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString2));
        intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent2.setPackage("com.android.chrome");
        try {
            MainActivity.this.startActivity(intent2);
        } catch (ActivityNotFoundException ex) {
            // Chrome browser presumably not installed so allow user to choose instead
            intent2.setPackage(null);
            MainActivity.this.startActivity(intent2);
        }
    }

    public void gotoEtherBeat(View view) {
        String urlString2 = "https://github.com/scorelab/EtherBeat";
        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString2));
        intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent2.setPackage("com.android.chrome");
        try {
            MainActivity.this.startActivity(intent2);
        } catch (ActivityNotFoundException ex) {
            // Chrome browser presumably not installed so allow user to choose instead
            intent2.setPackage(null);
            MainActivity.this.startActivity(intent2);
        }
    }

    public void gotoBassaMobile(View view) {
        String urlString2 = "https://github.com/scorelab/Bassa-mobile";
        Intent intent2 = new Intent(Intent.ACTION_VIEW, Uri.parse(urlString2));
        intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent2.setPackage("com.android.chrome");
        try {
            MainActivity.this.startActivity(intent2);
        } catch (ActivityNotFoundException ex) {
            // Chrome browser presumably not installed so allow user to choose instead
            intent2.setPackage(null);
            MainActivity.this.startActivity(intent2);
        }
    }


}
