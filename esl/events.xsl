<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--  Retrieve all events with a given date
          Note: this is used to group all events with same date with the "Muenchian Method"
                (http://www.jenitennison.com/xslt/grouping/muenchian.html)
     -->
    <xsl:key name="events-by-date" match="/events/event" use="@date" />

    <xsl:template match="/">
        <html>
            <head>
                <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css' />
                <link rel="stylesheet" type="text/css" href="events.css" />
                <title>NaN stuff</title>
            </head>
            <body>
                <h1> What's going on... </h1>

                <div class="content">
                    <xsl:apply-templates />
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="events">
            <xsl:call-template name="events-group" />
    </xsl:template>

    <!-- A group of events with the same date -->
    <xsl:template name="events-group">
        <!-- loops on all events (keeping only the first when events with same date) -->
        <xsl:for-each  select="event[generate-id() = generate-id(key('events-by-date', @date)[1]) ]" >
            <div class="date">
                <xsl:value-of select="@date" />
            </div>
            <xsl:apply-templates select="key('events-by-date', @date)" />
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="event" >
        <div class="event">
            <div class="action">
                <xsl:apply-templates select="action" />
            </div>
            <div class="references">
                <xsl:apply-templates select="references/reference"/>
            </div>
             <div class="tags">
                <xsl:apply-templates select="tags"/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="action">
        <div class="type">
            <xsl:value-of select="@type" />
        </div>
        <div class="content">
            <xsl:value-of select="." />
        </div>
    </xsl:template>

    <xsl:template match="reference">
        <a target="_black">
            <xsl:attribute name="href">
                <xsl:value-of select="@href" />
            </xsl:attribute>
            <xsl:value-of select="@type" />
        </a>
        <xsl:if test ="position() != last()">, </xsl:if>
    </xsl:template>

    <xsl:template match="tags">
        <xsl:apply-templates select="tag" />
    </xsl:template>

    <xsl:template match="tag">
        <xsl:value-of select="." />
        <xsl:if test ="position() != last()">, </xsl:if>
    </xsl:template>
</xsl:stylesheet>
