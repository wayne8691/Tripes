package com.iii.trip.trainandhotel.utility;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.UUIDGenerator;

public class IdGenerator extends UUIDGenerator {
    
    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object obj) {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS", Locale.TAIWAN)) +
                "-" + super.generate(session, obj).toString();
    }

}
