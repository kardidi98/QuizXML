<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <head>
            <title>Quiz</title>
            <link rel="shortcut icon" type="text/css" href="icon.ico"/>
            <link href="style.css" rel="stylesheet" type="text/css" media="all"/>
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous"/></head>
        <body>
            <div style="padding:30px;background-color:#16A085;">
                
                <div >
                    <h1  style="color:white;text-align:center;">Quiz en ligne</h1>
                    <br/>
                    <div id="menu" style="text-align:center;">
                        <ul>
                            <li class="menu">
                                <a href="#" onclick="$('#score').hide();$('#start').fadeIn();$('.questionnaire').hide();">Accueil</a></li>
                            <li class="menu"><a href="#" onclick="$('#start').hide(); $('#score').hide();$('.questionnaire').hide();$('.debutant').fadeIn();">Débutant</a></li>
                            <li class="menu"><a href="#" onclick="$('#score').hide();$('#start').hide();$('.questionnaire').hide();$('.intermediaire').fadeIn();">Intermidaire</a></li>
                            <li class="menu"><a href="#" onclick="$('#score').hide();$('#start').hide();$('.questionnaire').hide();$('.expert').fadeIn();">Expert</a></li>
                        </ul>
                    </div>
                </div>
                
            </div>
          
            <div class="container" style="padding:50px;">
                <div class="row" >
                    
                    <div  class="col-sm-4" style="text-align:center;">
                        <div class="title">
                            <h3>Questionnaire débutant</h3>
                        </div>
                        <p>Ce niveau contient des questions simples auxquelles vous pouvez répondre facilement</p>
                    </div>   
                    <div  class="col-sm-4" style="text-align:center;">
                        <div class="title">
                            <h3>Questionnaire intermidiare </h3>
                        </div>
                        <p>C'est une niveau dont la difficulté est un peu elevée par rapport au niveau débutant</p>
                    </div>  
                    <div  class="col-sm-4" style="text-align:center;">
                        <div class="title">
                            <h3>Questionnaire expert</h3>
                        </div>
                        <p>Ici les choses deviennent un peu compliquée. Bonne chance :)</p>
                    </div>
                </div>
            </div>
            <hr/>
            <div style="text-align: center;">
                <button id="start" class="btn btn-primary" style="margin-top:20px;background-color:#16A085;" onclick="$('.questionnaire').hide();$('.debutant').fadeIn();$('#start').hide();">Commencer</button>
            </div>
            <div  style="margin-bottom:100px;">
                <xsl:for-each select="questionnaires/questionnaire">
                    <xsl:variable name="niveau" >
                        <xsl:value-of select="@niveau"/>
                    </xsl:variable>
                    
                    <div class="{@niveau} container questionnaire" style="display:none;">
                        <h2 ><xsl:value-of select="position()"/>-<xsl:value-of select="titre"/>:</h2> 
                        <div class="row" >
                            <xsl:for-each select="questions/question">
                                <div class="col-sm-6">
                                    <div class="rounded"  style="box-shadow:0 0 8px #16A085;padding:20px;margin-top:20px;margin-bottom:15px;height:210px;">
                                        <p style="text-decoration:underline;"><strong style="color:#16A085;"><xsl:value-of select="position()"/>-   </strong><xsl:value-of select="enonce"/></p>
                                        <ul  id="{$niveau}" style="list-style-type: none;margin-left:25px;">
                                            
                                            <xsl:for-each select="reponse">
                                                <li class="{@score}"><strong><xsl:value-of select="position()-1"/>)-</strong><xsl:value-of select="child::text()"/>.</li> 
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                    
                                    <input class="form-control {$niveau}" type="text"  placeholder="Repondez 0, 1, 2 ou 3" style="width:50%;background-color:white;" />
                                    <xsl:for-each select="reponse">
                                        <xsl:if test="@score=1">
                                            <span class="reponse"><span style="font-weight:bold;">Reponse: </span><span style="color:green;"><xsl:value-of select="child::text()"/>.</span></span>
                                        </xsl:if>
                                        
                                    </xsl:for-each>
                                    
                                    
                                    
                                </div>
                                
                            </xsl:for-each>
                            
                        </div>
                        
                    
                        <button class="btn btn-primary result" style="float:right;margin-top:20px;background-color:#16A085;" onclick="resultat({position()});$('#score').fadeIn();">Résultat</button>
                    </div>
                    
                    
                </xsl:for-each>
                <h2 id="score"  style="margin-top:100px;margin-bottom:150px;text-align:center;"></h2>
            </div>
            <hr/>
           <footer>
               <p style="text-align:center;">Copyright© <script>
                   var CurrentYear = new Date().getFullYear()
                   document.write(CurrentYear)
               </script>.</p>
           </footer>
        </body>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
        <script>
            $('.reponse').hide();
            $('.questionnaire').hide();
            $("#score").hide();
            
            function resultat(position){
            $("#score").hide();
            if(position==1){
            var score=0;
            var reponse=$(".debutant input");
            var suggest=$(".debutant ul");
            var i=0;
            var full=true;
            var valeurFausse=false;
            for(var r of reponse){
            if(r.value == "")
                full=false;
            
            else if(r.value==0){
                score+=parseInt(suggest[i].getElementsByTagName('li')[0].className);
            
            }
            else if(r.value==1){
                score+=parseInt(suggest[i].getElementsByTagName('li')[1].className);
            
            }
            else if(r.value==2){
                score+=parseInt(suggest[i].getElementsByTagName('li')[2].className);
            
            }
            else if(r.value==3){
                score+=parseInt(suggest[i].getElementsByTagName('li')[3].className);
            
            }
            else valeurFausse=true;
            i++;
            }
            
            }
            else if(position==2){
            var score=0;
            
            var reponse=$(".intermediaire input");
            var suggest=$(".intermediaire ul");
            var i=0;
            for(var r of reponse){
            if(r.value == "")
            full=false;
            
            else if(r.value==0){
            score+=parseInt(suggest[i].getElementsByTagName('li')[0].className);
            
            }
            else if(r.value==1){
            score+=parseInt(suggest[i].getElementsByTagName('li')[1].className);
            
            }
            else if(r.value==2){
            score+=parseInt(suggest[i].getElementsByTagName('li')[2].className);
            
            }
            else if(r.value==3){
            score+=parseInt(suggest[i].getElementsByTagName('li')[3].className);
            
            }
            else valeurFausse=true;
            i++;
            }
            
            
            }
            else {
                var score=0;
                $("#score").hide();
                var reponse=$(".expert input");
                var suggest=$(".expert ul");
                var i=0;
                for(var r of reponse){
                if(r.value == "")
                full=false;
                
                else if(r.value==0){
                score+=parseInt(suggest[i].getElementsByTagName('li')[0].className);
                
                }
                else if(r.value==1){
                score+=parseInt(suggest[i].getElementsByTagName('li')[1].className);
                
                }
                else if(r.value==2){
                score+=parseInt(suggest[i].getElementsByTagName('li')[2].className);
                
                }
                else if(r.value==3){
                score+=parseInt(suggest[i].getElementsByTagName('li')[3].className);
                
                }
                else valeurFausse=true;
                i++;
                }
                
                
                }
                if(full==false){
                    alert("Vous n'avez pas répondu à toutes les questions!");
                
                }
                else if(valeurFausse==true){
                       alert("Vous avez donné une réponse inacceptable!");
                }
                else{
                     $('#score').fadeIn();
                     $('.reponse').fadeIn();
                    document.getElementById("score").innerHTML="Résultat: "+score+"/"+reponse.length;
                    
                }
            }
            
        </script>
    </xsl:template>
</xsl:stylesheet>