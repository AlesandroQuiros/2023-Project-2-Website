<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
    <xsl:variable name="XMLstore" select="document('../xml/store.xml')"/>
        <html lang="en">
            <head>
                <title>Products - Proud Shop</title>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
                <link rel="stylesheet" href="../assets/css/main.css" />
            </head>
            <body>
                
                <!-- Header -->
                <header id="header">
                    <div class="inner">
                        <a href="../index.html" class="logo"><xsl:value-of select="$XMLstore/store/name"/></a>
                        <nav id="nav">
                            <a href="../index.html">Home Page</a>
                            <a href="#">Products</a>
                            <a href="../xml/servicesWeb.xml">Services</a>
                            <a href="../web/contact.html">Contact</a>
                        </nav>
                    </div>
                </header>
                <a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
                
                <!-- Main -->
                <section id="main" >
                    <div class="inner">
                        <header>
                            <h1>Products Catalog</h1>
                        </header>
                        <div class="table-wrapper">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Price</th>
                                        <th>Price with TAX</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="$XMLstore/store/storage/product">
                                        <tr>
                                            <td><a><xsl:attribute name="href">../images/<xsl:value-of select="image"/></xsl:attribute> <xsl:attribute name="target">_blank</xsl:attribute><img><xsl:attribute name="src">../images/<xsl:value-of select="url"/></xsl:attribute></img></a></td>
                                            <td><span class="highlightName"><xsl:value-of select="name"/></span></td>
                                            <td>
                                                <ul>
                                                    <xsl:for-each select="description">
                                                        <li><xsl:value-of select="."/></li>
                                                    </xsl:for-each>
                                                </ul>
                                            </td>
                                            <td>
                                                <xsl:value-of select="price"/>
                                                <xsl:choose>
                                                    <xsl:when test="price[@currency='euro']">
                                                        € | <xsl:value-of select="format-number(price * 1.06,'#.00')"/> $
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        $ | <xsl:value-of select="format-number(price * 0.94,'#.00')"/> €
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                            <td>
                                                <xsl:value-of select="format-number(price+(//vat*price div 100),'#.00')"/>
                                                <xsl:choose>
                                                    <xsl:when test="price[@currency='euro']">
                                                        € | <xsl:value-of select="format-number(price * 1.06 + (//vat*price div 100),'#.00')"/> $
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        $ | <xsl:value-of select="format-number(price * 0.94 + (//vat*price div 100),'#.00')"/> €
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="4">*All products come with 7 day warranty</td>		
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </section>
                        
                        <!-- Footer -->
                        <footer id="footer">
                            <div class="inner">
                                <div class="copyright">
                                    ® 2023 Urtzi Alesandro
                                    <ul class="icons">
                                        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                                        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                                        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                                        <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
                                        <li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
                                        <li><a href="#" class="icon fa-tumblr"><span class="label">Tumblr</span></a></li>
                                    </ul>
                                    <xsl:value-of select="$XMLstore/store/business/name"/>
                                    <xsl:value-of select="$XMLstore/store/business/location"/>
                                </div>
                            </div>
                        </footer>
                        
                        <!-- Scripts -->
                        <script src="../assets/js/jquery.min.js"></script>
                        <script src="../assets/js/skel.min.js"></script>
                        <script src="../assets/js/util.js"></script>
                        <script src="../assets/js/main.js"></script>
                        
                    </body>
                </html>
            </xsl:template>
        </xsl:stylesheet>
